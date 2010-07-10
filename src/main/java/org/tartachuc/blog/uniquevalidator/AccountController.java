package org.tartachuc.blog.uniquevalidator;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/accounts")
public class AccountController {

	@PersistenceContext
	private EntityManager em;
	
	@RequestMapping(method=RequestMethod.GET)
	public void accounts(ModelMap model) {
		model.addAttribute(findAll());
		model.addAttribute(new Account());
	}

	
	@RequestMapping(method=RequestMethod.POST)
	@Transactional
	public String newAccount(@ModelAttribute @Valid Account account, Errors errors, ModelMap model) {
		if (errors.hasErrors()) {
			return "accounts";
		} else {
			em.persist(account);
			model.addAttribute(new Account());
			return "redirect:accounts";
		}
	}

	public List<Account> findAll() {
		return em.createQuery("from Account", Account.class).getResultList();
	}
}
