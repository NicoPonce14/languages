package com.nicolas.lenguaje.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicolas.lenguaje.models.Lenguaje;
import com.nicolas.lenguaje.repositories.LenguajeRepo;

@Service
public class LenguajeServ {

	@Autowired
	private LenguajeRepo lengRepository;
	
	// Devolviendo todos los libros.
		public List<Lenguaje> allLang() {
			return lengRepository.findAll();
		}

		// Creando un libro.
		public Lenguaje createLang(Lenguaje l ) {
			return lengRepository.save(l);
		}

		// Obteniendo la información de un libro
		public Lenguaje findLang(Long id) {
			Optional<Lenguaje> lenguaje = lengRepository.findById(id);
			if (lenguaje.isPresent()) {
				return lenguaje.get();
			} else {
				return null;
			}
		}
		
		
		public Lenguaje updateLang(Lenguaje l) {
			Lenguaje updateL = findLang(l.getId());
			
			updateL.setCreator(l.getCreator());;
			updateL.setName(l.getName());
			updateL.setCurrentVersion(l.getCurrentVersion());
			
			
			lengRepository.save(updateL);
			
			return updateL;
		}
		
		public void deleteLang(Long id) {
			lengRepository.deleteById(id);
			
		}
	
}
