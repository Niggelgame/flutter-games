package config

import "github.com/niggelgame/web-games-server/pkg/logger"
import "github.com/joho/godotenv"
import "github.com/kelseyhightower/envconfig"

type Config struct {
	PublicIp    string `default:"127.0.0.1" envconfig:"PUBLIC_IP"`
	StunPort    int    `default:"19302" envconfig:"STUN_PORT"`
	Realm       string `default:"web_games"`
	BindAddress string `default:":8080" envconfig:"BIND_ADDRESS"`
}

func LoadConfig() *Config {
	_ = godotenv.Load()

	var cfg Config
	err := envconfig.Process("SERVER", &cfg)
	if err != nil {
		logger.Panicf("failed to laod config: ", err)
	}

	return &cfg
}
