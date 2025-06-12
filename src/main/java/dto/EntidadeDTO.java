package dto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import modelos.Entidade;
import modelos.Usuario;

public class EntidadeDTO {
	private String nome, cnpj, email, fone, senhaHash;
	private LocalDate dataCadastro;	
	private int entidadeId, usuarioId;

	public EntidadeDTO(Entidade ent, Usuario user) {
		this.nome = ent.getNome();
		this.cnpj = ent.getCnpj();
		this.email = user.getEmail();
		this.fone = ent.getFone();
		this.senhaHash = user.getSenhaHash();
		this.dataCadastro = ent.getDataCadastro();
		this.entidadeId = ent.getId();
		this.usuarioId = user.getId();
	}

	public String getNome() {
		return nome;
	}

	public String getCnpj() {
		return cnpj;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getFone() {
		return fone;
	}

	public String getSenhaHash() {
		return senhaHash;
	}

	public String getDataCadastro() {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	    return dataCadastro.format(formatter);
	}

	public int getEntidadeId() {
		return entidadeId;
	}
	
	public int getUsuarioId() {
		return usuarioId;
	}
}