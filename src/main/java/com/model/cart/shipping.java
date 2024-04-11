//IT22312426
//D.D.Irushi Gunawardaana

package com.model.cart;

public class shipping {

	protected int id;
	protected String name;
	protected String address;
	protected String country;
	
	public shipping() {
	}
	
	public shipping(String name, String address, String country) {
		super();
		this.name = name;
		this.address = address;
		this.country = country;
	}

	public shipping(int id, String name, String address, String country) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.country = country;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	
}

