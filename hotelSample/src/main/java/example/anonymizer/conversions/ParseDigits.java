/*
 * Copyright (c) 2005-18 Esito AS. All rights reserved.
 */
package example.anonymizer.conversions;

import no.esito.anonymizer.IConversion;

/**
 * Simple example to parse digits from a string
 */
public class ParseDigits implements IConversion {

	public static final String LABEL = "ParseDigits - simply remove all non-digits";

	@Override
	public Object convert(String input) {
		if(input == null)
			return "0";
		char[] chars = input.toCharArray();
		StringBuilder sb = new StringBuilder();
		for (char c : chars) {
			if(Character.isDigit(c))
				sb.append(c);
		}
		return sb.length()==0?"0":sb.toString();
	}

}
