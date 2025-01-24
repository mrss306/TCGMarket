package model;

import java.io.Serializable;
import java.time.LocalDate;

public class ProductBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	int id;
	String nome;
	float prezzo;
	int saldo;
	LocalDate data_uscita;
	String descrizione;
	int quantità;
	boolean visible;
	
	public ProductBean() {
		id = -1;
		nome = "";
		prezzo = -1;
		saldo = -1;
		data_uscita = LocalDate.MIN;
		descrizione = "";
		quantità = -1;
		visible = false;
		
	}
	
	public boolean isVisible() {
		return visible;
	}
	
	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getPrezzo() {
		return (float) (Math.round((prezzo )* 100.0) / 100.0);
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public int getSaldo() {
		return saldo;
	}

	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}

	public LocalDate getData_uscita() {
		return data_uscita;
	}

	public void setData_uscita(LocalDate data_uscita) {
		this.data_uscita = data_uscita;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}

	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + quantità + ". " + descrizione+" "
				+saldo+" "+data_uscita;
		
	
	}
	
	

}
