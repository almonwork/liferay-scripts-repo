package com.liferay.support.database

import groovy.sql.Sql

protected class OracleConnection{

	def connectionString

	def username

	def password

	def driverClassName

	def executeQuery = { query , action ->

		def sql

		try{
			sql = Sql.newInstance(connectionString, username, password, driverClassName)
			sql.eachRow(query,action)
		}catch(Exception e){
			println """ No se ha podido establecer la conexión a la base de datos con la siguiente información:
						Cadena de conexión: $connectionString
						Usuario: $username
						Password: $password
						Driver: $driverClassName
					"""
			return false
		}

		finally {
			sql?.close()
		}

		true
	}
}


class TestOracleRac {

	public static void main (String[] args) {

		if(args.length != 4){
			println "TestOracleRac: <Cadena de conexión> <usuario> <password> <clase del driver>"
			return
		}

		def connection = new OracleConnection(connectionString:args[0],
				username:args[1],
				password:args[2],
				driverClassName:args[3])

		if(!connection.executeQuery("SELECT 1 FROM DUAL", {}))
		 	return
		
		println "Conexión satisfactoria"
	}
}
