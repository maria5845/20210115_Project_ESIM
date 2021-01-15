package com.tectone.util;

import com.autogen.main.AutoCodeGen;

public class SourceGenerator {

	public static void main(String[] args) {
		
		
		String rootPath = "C:/dev/workspace/DefaultSource/";
		String businessPackage = "com.tectone.web.business";
		String beanFullPath = "com.tectone.web.model.TestBean"; // is no exist, then make
		String createMenu = "Test"; // camel case

		
		AutoCodeGen gen = new AutoCodeGen(rootPath, businessPackage, beanFullPath, createMenu);
		gen.createDefaultSource();

	}

}
