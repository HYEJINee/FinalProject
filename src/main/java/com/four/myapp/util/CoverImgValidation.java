package com.four.myapp.util;

import org.apache.tika.Tika;

public class CoverImgValidation {
	public static boolean imageValidator(byte[] bytes) {
		Tika tika = new Tika();
		
		String mimeType = tika.detect(bytes);
		
		String[] allowedTypes = {"image/jpeg", "image/gif", "image/png"};
		
		for (int i = 0; i < allowedTypes.length; i++) {
			if(mimeType.equals(allowedTypes[i])) {
				return true;
			}
		}
		return false;
	}
}
