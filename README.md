# Kafka

This project aims to have a turnkey test kafka broker.

the functionalities:
- deployment of the brocker ( see SetUp ENV / Kafka ENV )
- init js env tu produce and consum data ( see SetUp ENV / JS ENV )
- Creation of a topic
- Consume / produce data
    * via kafka
    * via js code

## SetUp ENV

``` sudo apt install curl vim git ```

### Kafka ENV
``` sudo bash kafka_start.bash ```

### Creat Topic
```  kafka/kafka_new_topic.bash [KAFKA_END_POINT_HOST] [KAFKA_END_POINT_PORT] [KAFKA_TOPIC_NAME] ```

ex : kafka/kafka_new_topic.bash localhost 9092 test-topic

### Kafka producer 
``` kafka/kafka_producer.bash [KAFKA_END_POINT_HOST] [KAFKA_END_POINT_PORT] [KAFKA_TOPIC_NAME] ```

ex : kafka/kafka_producer.bash localhost 9092 test-topic

### Kafka consumer
```  kafka/kafka_consumer.bash [KAFKA_END_POINT_HOST] [KAFKA_END_POINT_PORT] [KAFKA_TOPIC_NAME] ```

ex : kafka/kafka_consumer.bash localhost 9092 test-topic

### js ENV
you need to install node js before going further, thanks for seeing here
https://nodejs.org/en/download/package-manager 

For Debian open a terminal and 
```
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
```

``` sudo bash js/js_init_env.bash ```   
Important : the name of the topic is hard written in the javascript code if to change this value it would have to be changed in the code.

### js  producer 

``` node js/js_producer.js ```

### js consumer

``` node js/js_consumer.js ```


## Clean ENV

``` sudo bash js/js_clean_env.bash ```

``` sudo bash uninstall_kafka.bash ```
