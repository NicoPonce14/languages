package com.nicolas.lenguaje.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;


import com.nicolas.lenguaje.models.Lenguaje;
import com.nicolas.lenguaje.services.LenguajeServ;

import jakarta.validation.Valid;

@Controller
public class LenguajeController {

	@Autowired
	private LenguajeServ serv;

	@GetMapping("/")
	public String raiz() {
		return "redirect:/languages";
	}

	// trae todos los datos de la Base de datos y los muestra en la vista
	@GetMapping("/languages")
	public String index(@ModelAttribute("lenguaje") Lenguaje lenguaje, Model m) {
		List<Lenguaje> lengua = serv.allLang();
		m.addAttribute("lengua", lengua);
		return "index.jsp";
	}

	/*
	 * @GetMapping("/languages") public String nuevo(@ModelAttribute("lenguaje")
	 * Lenguaje lenguaje) { return "index.jsp"; }
	 */

	@PostMapping("/languages")
	public String nuevoLang(@Valid @ModelAttribute("lenguaje") Lenguaje lenguaje, BindingResult binding) {
		if (binding.hasErrors()) {
			return "index.jsp";
		} else {
			serv.createLang(lenguaje);
			return "redirect:/languages";
		}
	}

	// Metodo para eliminar un registro
	@GetMapping("/languages/{id}")
	public String eliminarLibro(@PathVariable("id") Long id) {
		serv.deleteLang(id);
		return "redirect:/languages";
	}

	// metodo para llenar los campos del formulario con los datos que se van a
	// editar
	@GetMapping("/languages/edit/{id}")
	public String cargaFormularioLeng(@ModelAttribute("lenguaje") Lenguaje lenguaje, @PathVariable("id") Long id,
			Model m) {
		m.addAttribute("lenguaje", serv.findLang(id));
		return "edit.jsp";
	}

	// Metodo que actualiza el valor de los campos en la base de datos
	@PutMapping("/languages/edit/{id}")
	public String editarLeng(@ModelAttribute("lenguaje") Lenguaje lenguaje, @PathVariable("id") Long id, Model m,
			BindingResult binding) {
		if (binding.hasErrors()) {
			return "edit.jsp";
		} else {
			serv.updateLang(lenguaje);
			return "redirect:/languages";
		}
	}
	
	//METODO PARA MOSTRAR UN SOLO REGISTRO EN LA VISTA SHOW.JSP
	@GetMapping("/languages/show/{id}")
	public String mostrarLang(Model m, @PathVariable("id") Long id) {
		m.addAttribute("lengua",serv.findLang(id));
		return "show.jsp";
	}

}
