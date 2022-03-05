package packets

type Method string
func MethodAsString(m Method) string {
	return string(m)
}

type ResponseMethod string
func ResponseMethodAsString(m ResponseMethod) string {
	return string(m)
}

const (
	Hello     Method = "hello"
	Bye       Method = "bye"
	Offer     Method = "offer"
	Answer    Method = "answer"
	Candidate Method = "candidate"
	Keepalive Method = "keepalive"

	Invite          ResponseMethod = "invite"
	Init            ResponseMethod = "init"
	ServerBye       ResponseMethod = "bye"
	ServerKeepalive ResponseMethod = "keepalive"
	Error           ResponseMethod = "error"

	InvalidParams   string = "invalid-params"
	InvalidSession  string = "invalid-session"
	OutdatedSession string = "outdated-session"
	ClosingSession  string = "closing-session"
	IdAlreadyExists string = "id-already-exists"
)

type RequestPacket struct {
	Type Method      `json:"type"`
	Data interface{} `json:"data"`
}

type ResponsePacket struct {
	Type ResponseMethod `json:"type"`
	Data interface{}    `json:"data"`
}

type HelloPacket struct {
	Id         string                 `json:"id"`
	Type       string                 `json:"type"`
	IsServer   bool                   `json:"is_server"`
	GameConfig map[string]interface{} `json:"game_config"`
}

type InvitePacket struct {
	PeerId string `json:"peer_id"`
}

type InitPacket struct {
	SessionCode string `json:"session_code"`
}

type ByebyePacket struct {
	Reason     string `json:"reason"`
	PeerLeftId string `json:"peer_left_id"`
}

type PassThroughPacket struct {
	To   string                 `json:"to"`
	From string                 `json:"from"`
	Data map[string]interface{} `json:"data"`
}
