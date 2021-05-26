df_country_wise_latest = spark.read.csv(
    'wasb:///hive/country_wise_latest - country_wise_latest.csv', header=True, inferSchema=True)
df_day_wise = spark.read.csv(
    'wasb:///hive/day_wise - day_wise.csv', header=True, inferSchema=True)
df_worldometer_data = spark.read.csv(
    'wasb:///hive/worldometer_data - worldometer_data.csv', header=True, inferSchema=True)


#conveting spark data frame the pandas data frame
df_country_wise_latest = df_country_wise_latest.toPandas()
df_day_wise = df_day_wise.toPandas()
df_worldometer_data = df_worldometer_data.toPandas()
df_worldometer_data.head()

df_worldometer_data.drop(['NewCases', 'NewDeaths', 'NewRecovered', 'Tot Cases/1M pop', 'Deaths/1M pop', 'TotalTests', 'Tests/1M pop',
                          'WHO Region'
                          ], axis=1, inplace=True)

df_worldometer_data.dtypes
df_worldometer_data.isnull().sum()

#convert and save the file in the azure blob storage
spark_df = spark.createDataFrame(df_worldometer_data)
spark_df.write.csv('wasb:///example/data/covid19_world.csv')
