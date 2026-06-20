package com.command;

public class CommandTest {

    public static void main(String[] args) {

        Light light = new Light();

        Command lightOn = new LightOnCommand(light);
        Command lightOff = new LightOffCommand(light);

        RemoteControl remote = new RemoteControl();

        System.out.println("Turning Light ON:");
        remote.setCommand(lightOn);
        remote.pressButton();

        System.out.println();

        System.out.println("Turning Light OFF:");
        remote.setCommand(lightOff);
        remote.pressButton();
    }
}