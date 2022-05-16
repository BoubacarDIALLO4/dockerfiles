describe (' APP web interface', () => {
    beforeEach(() => {
        cy.visit('/')
    })
    it('Should be ready', () => {
        cy.title().should('eq', 'Boubacar')
    })
    it('Should find status', () => {
       cy.request({
         method: 'GET',
         url: '/'})
         .should((response) => {
            expect(response.status).to.eq(200)
         })
    })



})