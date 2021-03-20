package org.qinlin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MarketApplication {

    public static void main(String[] args) {
        System.out.println("\n" +
                "  ____  _       _ _         ______          _                              __  __            _        _   \n" +
                " / __ \\(_)     | (_)       |  ____|        | |                            |  \\/  |          | |      | |  \n" +
                "| |  | |_ _ __ | |_ _ __   | |__  __  _____| |__   __ _ _ __   __ _  ___  | \\  / | __ _ _ __| | _____| |_ \n" +
                "| |  | | | '_ \\| | | '_ \\  |  __| \\ \\/ / __| '_ \\ / _` | '_ \\ / _` |/ _ \\ | |\\/| |/ _` | '__| |/ / _ \\ __|\n" +
                "| |__| | | | | | | | | | | | |____ >  < (__| | | | (_| | | | | (_| |  __/ | |  | | (_| | |  |   <  __/ |_ \n" +
                " \\___\\_\\_|_| |_|_|_|_| |_| |______/_/\\_\\___|_| |_|\\__,_|_| |_|\\__, |\\___| |_|  |_|\\__,_|_|  |_|\\_\\___|\\__|\n" +
                "                                                               __/ |                                      \n" +
                "                                                              |___/                                       \n");
        SpringApplication.run(MarketApplication.class, args);
    }

}
