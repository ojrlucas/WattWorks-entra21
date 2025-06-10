package modelos;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Usuario {
	private int id;
    private String email, senhaHash;	

    public Usuario(String email, String senha) {
        this.email = email;
        this.senhaHash = gerarHash(senha);
    }
    
    public Usuario(int id, String email, String senha) {
        this.id = id;
    	this.email = email;
        this.senhaHash = senha;
    }
    
    public int getId() {
		return id;
	}

	public String getEmail() {
        return email;
    }
    public String getSenhaHash() {
        return senhaHash;
    }

    private String gerarHash(String senha) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(senha.getBytes());
            
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
            
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Erro ao gerar hash da senha", e);
        }
    }
    
    public boolean verificarSenha(String senhaDigitada) {
        String hashDigitado = gerarHash(senhaDigitada);
        return hashDigitado.equals(this.senhaHash);
    }
}

