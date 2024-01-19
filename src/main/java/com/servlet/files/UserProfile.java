package com.servlet.files;

public class UserProfile {
    private String fullname;
    private String email;
    private int age;
    private double salary;

    public UserProfile(String fullname, String email, int age, double salary) {
        this.fullname = fullname;
        this.email = email;
        this.age = age;
        this.salary = salary;
    }

    // Getter methods
    public String getFullname() {
        return fullname;
    }

    public String getEmail() {
        return email;
    }

    public int getAge() {
        return age;
    }

    public double getSalary() {
        return salary;
    }
}
