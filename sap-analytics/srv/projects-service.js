<<<<<<< HEAD
const cds = require('@sap/cds')
const log  = cds.log('projects-service')
const {Projects} = cds.entities('sapanalytics.db')


module.exports = (srv) =>{

    srv.on ('hasProjectEnded', (request)=>{
        log.info('on function hasProjectEnded data:', request.data, 'params:', request.params)
        request.reply(true)
    })

    srv.on('end','Projects', async (request) => {
        log.info('on action Projects/end data:', request.data, 'params:', request.params)
        // await UPDATE(Projects).set('endDate', request.now).where({'ID':request.params[0]})
    })

=======
const cds = require ('@sap/cds')
const log = cds.log('projects-service')
const {Projects} = cds.entities('sepaanalytics.db')

module.exports = async (srv) => {

    srv.on ('hasProjectEnded', (request) => {
        log.info('on function hasProjectEnded data: ', request.data, 'params: ', request.params)
        request.reply(true)
    })

    srv.on('end', 'Projects', (request) => {
        log.info('on action Projects/end data: ', request.data, 'params: ', request.params)
    })
>>>>>>> 54faafbf9a560f781871634e8487da2f179ebef0
}