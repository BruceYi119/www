package www.security;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Security {

	private String sha512;

	public Security(String str) {
		getSha512(str);
	}

	private void getSha512(String str) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.reset();
			md.update(str.getBytes("utf-8"));
			sha512 = String.format("%0128x", new BigInteger(1, md.digest()));
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public String getSha512() {
		return sha512;
	}

}