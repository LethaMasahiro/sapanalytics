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
}