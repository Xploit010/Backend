const express = require('express');

// yup validacion de datos
const yup = require('yup');

const connection = require('./db');

const router = express.Router();


const schema = yup.object().shape({
  nombre: yup.string().required("El nombre del producto es obligatorio"),
  descripcion: yup.string().required("La descripcion del producto es obligatoria"),
  precio: yup.string().required("El precio es obligatorio"),
  image: yup.string().url("La url es autentica").required("La url es obligatoria"),
})

router.post("/productos", async function (request, response) {
  const datos = request.body

  try {
    const result = await schema.validate(datos) // validamos que el objeto cumpla con el esquema
    console.log(result)

    const query =
      "INSERT INTO productos (nombre, descripcion, precio, image) VALUES (?, ?, ?, ?)"

    connection.execute(query, Object.values(datos), function (error, result) {
      if (error) {
        response.status(400).json({
          message: "Error al guardar el producto",
          error: error,
        })
      } else {
        response.json({
          message: "Producto guardado",
          data: result,
        })
      }
    })
  } catch (error) {
    response.status(400).json({
      message: error.message,
    })
  }
})


router.get("/productos/:id", function (request, response) {
  const { id } = request.params

  const query = "SELECT * FROM productos WHERE id = ?"

  connection.query(query, [id], function (error, result) {
    if (error) {
      response.status(400).json({
        message: "Error al obtener el producto",
        error: error,
      })
    } else {
      if (result.length > 0) {
        response.json(result[0])
      } else {
        response.status(404).json({
          message: "Producto no encontrado",
        })
      }
    }
  })
})


router.get("/productos", function (req, res) {

  connection.query(
    "SELECT * FROM productos ORDER BY id DESC",
    function (error, result) {
      if (error) {
        console.log("Error fetching productos", error)
      } else {
        res.json(result)
      }
    },
  )
})

router.put("/productos/:id", async function (req, res) {
  const data = req.body
  const { id } = req.params

  //const query = "UPDATE productos SET ? WHERE id = ?"
  try {
    await schema.validate(data) // validamos que el objeto cumpla con el esquema

    const query =
      "UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, image = ? WHERE id = ?"

    connection.execute(
      query,
      Object.values(data).concat(id),
      function (error, result) {
        if (error) {
          res.status(400).json({
            message: "Error al actualizar el producto",
            error,
          })
        } else {
          res.json({
            message: "producto actualizado",
            data: result,
          })
        }
      },
    )
  } catch (error) {
    response.status(404).json({
      message: error.message,
    })
  }
})

router.delete("/productos/:id", function (request, response) {
  const { id } = request.params

  const query = "DELETE FROM productos WHERE id = ?"

  connection.execute(query, [id], function (error, result) {
    if (error) {
      response.status(400).json({
        message: "Error al eliminar el producto",
        error
      })
    } else {
      response.json({
        message: "Producto eliminado correctamente",
        data: result
      })
    }
  })
})

module.exports = router





