struct Will {
  let topic: String
  let payload: String
  let qos: QoS
  let retain: Bool

  init(fromJsWill willFromJs: NSDictionary) {
    self.topic = willFromJs["topic"] ?? "last/will/and/testament"
    self.payload = willFromJs["payload"] ?? "Mozart!"
    self.qos = QoS(rawValue: willFromJs["qos"] ?? 0)
    self.retain = willFromJs["retain"] ?? false
  }

  func toCocoaMqttMessage() -> CocoaMQTTMessage = CocoaMQTTMessage(self.topic, self.payload, self.qos, self.retained)
}