package com.google.vote.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.vote.domain.Criteria;

import lombok.AllArgsConstructor;


/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {

	

	@GetMapping("/")
	public String index(Criteria cri, Model model) {

		return "redirect:/vote";
	}

	@GetMapping("/vote")
	public void vote(Model model, Criteria cri) {
		model.addAttribute("vote", cri);

	}

	@GetMapping("/result")
	public void result(Model model, Criteria cri) {
		model.addAttribute("vote", cri);
	}

	/*
	 * http://localhost/district?vno=59&code=3&id=20180613
	 */
	@GetMapping("/elect")
	public void elect(Model model, Criteria cri) {
		model.addAttribute("vote", cri);
	}

	/*
	 * http://localhost/district?vno=59&code=3&id=20180613
	 */
	@GetMapping("/district")
	public void district(Model model, Criteria cri) {
		model.addAttribute("vote", cri);
	}
}
