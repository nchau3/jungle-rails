before(() => cy.visit('/'))

it("There is products on the page", () => {  
  cy.get(".products article").should("be.visible");
});

it("Changes cart quantity after adding to cart", () => {  
  cy.contains("Add").first().click({force: true})
  cy.get(".end-0 > .nav-link").should("include.text", "1")
});