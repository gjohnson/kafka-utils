Feature: kafka_consumer_manager offset_get subcommand

  Scenario: Calling the offset_get command
     Given we have an existing kafka cluster with a topic
      when we produce some number of messages into the topic
      when we consume some number of messages from the topic
      when we call the offset_get command
      then the correct offset will be shown

  Scenario: Calling the offset_get command with json option
     Given we have an existing kafka cluster with a topic
      when we produce some number of messages into the topic
      when we consume some number of messages from the topic
      when we call the offset_get command with the json option
      then the correct json output will be shown

  @kafka9
  Scenario: Committing offsets into Kafka and fetching offsets with kafka option
     Given we have an existing kafka cluster with a topic
     Given we have initialized kafka offsets storage
      when we commit some offsets for a group into kafka
      when we fetch offsets for the group with the kafka option
      then the fetched offsets will match the committed offsets

  @kafka9
  Scenario: Committing offsets into Kafka and fetching offsets with dual option
     Given we have an existing kafka cluster with a topic
     Given we have initialized kafka offsets storage
      when we commit some offsets for a group into kafka
      when we fetch offsets for the group with the dual option
      then the fetched offsets will match the committed offsets

  @kafka9
  Scenario: Calling the offset_get command with dual storage
     Given we have an existing kafka cluster with a topic
     Given we have initialized kafka offsets storage
      when we produce some number of messages into the topic
      when we consume some number of messages from the topic
      when we call the offset_set command and commit into kafka
      when we call the offset_get command with the dual storage option
      then the offset that was committed into Kafka will be shown

  @kafka9
  Scenario: Calling the offset_get command with kafka storage
     Given we have an existing kafka cluster with a topic
     Given we have initialized kafka offsets storage
      when we produce some number of messages into the topic
      when we consume some number of messages from the topic
      when we call the offset_set command and commit into kafka
      when we call the offset_get command with kafka storage
      then the offset that was committed into Kafka will be shown
