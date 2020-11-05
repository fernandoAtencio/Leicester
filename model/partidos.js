const pool = require("./../utils/bd"); // referencia de la conexión :D
const T_PARTIDOS = "partidos";
const T_EQUIPOS = "equipos";
const T_JUGADORES = "jugadores";
const T_FIGURAS = "figuras";

const get = async () => {
  const query =
    "SELECT * FROM ?? as P inner join ?? as E on P.id_equipo = E.id_equipo inner join ?? as F on P.id_partido = F.id_partido WHERE P.habilitado = ?";
  const params = [T_PARTIDOS, T_EQUIPOS, T_FIGURAS, true];
  return await pool.query(query, params);
};

/*
const single = async (id) => {
  const query =
    "SELECT idCategoria, cu.nombre, cu.id, cat.nombre as nombreCategoria  FROM ?? as cu JOIN ?? as cat on cu.idCategoria = cat.id where cu.habilitado = ? and cu.id = ?";
  const params = [T_CURSOS, T_CATEGORIAS, true, id];
  return await pool.query(query, params);
};
*/
const create = (obj) =>
  pool
    .query("INSERT INTO ?? SET ?", [T_CURSOS, obj])
    .then((result) => result)
    .catch((e) => e);

module.exports = { get, single, create };
