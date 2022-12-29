
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
}