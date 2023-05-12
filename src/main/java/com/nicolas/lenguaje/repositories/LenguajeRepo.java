package com.nicolas.lenguaje.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.nicolas.lenguaje.models.Lenguaje;

@Repository
public interface LenguajeRepo extends CrudRepository<Lenguaje, Long> {

	// Este método recupera todos los datos de la BD
		List<Lenguaje> findAll();

		/*// Este método encuentra un libro por su descripción
		List<Lenguaje> findByDescriptionContaining(String search);

		// Este método cuenta cuántos libros contiene cierta cadena en el título
		Long countByTitleContaining(String search);

		// Este método borra un libro que empieza con un título específico
		Long deleteByTitleStartingWith(String search);
	*/
}
