// Replaces "$ref": "#/components/headers/<name>" links with the header definition.
// openapi-merge-cli cannot resolve header refs when combining schemas.
const fs = require("fs");

const file = process.argv[2];
const spec = JSON.parse(fs.readFileSync(file, "utf8"));
const headers = (spec.components && spec.components.headers) || {};
const prefix = "#/components/headers/";

function inline(node) {
  if (Array.isArray(node)) {
    return node.map(inline);
  }
  if (node && typeof node === "object") {
    const ref = node.$ref;
    if (typeof ref === "string" && ref.startsWith(prefix) && headers[ref.slice(prefix.length)]) {
      return JSON.parse(JSON.stringify(headers[ref.slice(prefix.length)]));
    }
    for (const key of Object.keys(node)) {
      node[key] = inline(node[key]);
    }
  }
  return node;
}

fs.writeFileSync(file, JSON.stringify(inline(spec), null, 2));
