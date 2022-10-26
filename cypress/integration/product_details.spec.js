before(() => cy.visit('/'))

it("clicking product should link to product details", () => {
  cy.get(".products article").first().click()
  cy.get(".products-show").should("be.visible");
});