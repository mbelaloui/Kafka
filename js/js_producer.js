// import the `Kafka` instance from the kafkajs library
const { Kafka } = require("kafkajs")

const kafka = new Kafka
(
  {
    clientId: 'my-app',
    brokers: ['localhost:9092']
  }
)
const producer = kafka.producer()
const kafka_topic = 'test-topic'

// define an async function that writes a new message each second
const run = async () => 
{
	await producer.connect()
	let i = 0

  setInterval(async () => 
  {
		try 
		{
			await producer.send(
      {
          topic: kafka_topic,
          messages: [
          {
              key: String(i),
              value: "this is message " + i,
          },],
        })
        console.log("writes: ", i)
			i++
		} catch (err) 
    {
			console.error("could not write message " + err)
		}
	}, 1000)
}

run().catch(console.error)