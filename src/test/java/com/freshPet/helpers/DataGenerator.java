package com.freshPet.helpers;

import com.github.javafaker.Faker;
import java.util.Random;

public class DataGenerator {
    static Faker faker = new Faker();

    public static String generateRandomId(){
        String id = faker.idNumber().valid();
        return id;
    }

    public static int generateRandomDigit(int min, int max){
        int digits = faker.number().numberBetween(min,max);
        return digits;
    }

    public static String generateRandomId(int min, int max){
        String digits = Integer.toString(faker.number().numberBetween(min,max));
        return digits;
    }

    public static String generateRandomNums(int index){
        String digits = faker.number().digits(index);
        return digits;
    }

    public static String generateRandomWord(){
        String digits = faker.gameOfThrones().character();
        return digits;
    }

    public static int generateRandomDigits(int n) {
        int m = (int) Math.pow(10, n - 1);
        return m + new Random().nextInt(9 * m);
    }

}