package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

public class AjaxCommand implements Command {

	public static final String api_key = "RGAPI-a22c847e-ce89-4d95-a942-47b933bae809";
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse("");

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("result", null);
	}



}
