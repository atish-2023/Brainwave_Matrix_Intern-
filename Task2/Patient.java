package com.hospital.dao;
public class Patient {
    private int id;
    private String name, gender, contact, address, email, password;
    private int age;

    public Patient(String name, int age, String gender, String contact, String address, String email, String password) {
        this.name = name; this.age = age; this.gender = gender;
        this.contact = contact; this.address = address;
        this.email = email; this.password = password;
    }
    
    public int getId() { return id; }
    public String getName() { return name; }
    public int getAge() { return age; }
    public String getGender() { return gender; }
    public String getContact() { return contact; }
    public String getAddress() { return address; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
}
