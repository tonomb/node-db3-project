
const db = require('../data/db-config')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
}

function find(){
  return db('schemes').select('*')
  
}

function findById(id){
  return db('schemes').where('id', id).first()
}

function findSteps(id){
  return db('steps')
  .join('schemes', 'steps.scheme_id', 'schemes.id')
  .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
  .where({scheme_id: id})
  .orderBy('steps.step_number')
}

function add(scheme){
  return db('schemes').insert(scheme)
    .then(ids =>{
      return findById(ids)
    })
}

function update(changes, id){
  return db('schemes').where({id}).update(changes)
    .then(()=>{
      return findById(id)
    })
}

function remove(id){
  return db('schemes').where({id}).del()
}