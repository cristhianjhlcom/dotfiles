local ok, ls = pcall(require, "luasnip")

if (not ok) then return end

ls.add_snippets("php", {
    ls.snippet("strict", {
        ls.text_node("declare(strict_types=1);"),
    }),
    ls.snippet("this", {
        ls.text_node("$this->"),
        ls.insert_node(1),
    }),
    ls.snippet("inv", {
        ls.text_node("public function __invoke("),
        ls.insert_node(1), -- Parámetro
        ls.text_node("): "),
        ls.insert_node(2, "void"), -- Tipo de retorno
        ls.text_node({"", "{", "    "}),
        ls.insert_node(3), -- Cuerpo de la función
        ls.text_node({"", "}", ""}),
    }),
    ls.snippet("pubf", {
        ls.text_node("public function "),
        ls.insert_node(1), -- Nombre de la función
        ls.text_node("("),
        ls.insert_node(2), -- Parámetros
        ls.text_node("): "),
        ls.insert_node(3, "void"), -- Tipo de retorno
        ls.text_node({"", "{", "    "}),
        ls.insert_node(0), -- Cuerpo de la función
        ls.text_node({"", "}", ""}),
    }),
    ls.snippet("prof", {
        ls.text_node("protected function "),
        ls.insert_node(1), -- Nombre de la función
        ls.text_node("("),
        ls.insert_node(2), -- Parámetros
        ls.text_node("): "),
        ls.insert_node(3, "void"), -- Tipo de retorno
        ls.text_node({"", "{", "    "}),
        ls.insert_node(0), -- Cuerpo de la función
        ls.text_node({"", "}", ""}),
    }),
    ls.snippet("prif", {
        ls.text_node("private function "),
        ls.insert_node(1), -- Nombre de la función
        ls.text_node("("),
        ls.insert_node(2), -- Parámetros
        ls.text_node("): "),
        ls.insert_node(3, "void"), -- Tipo de retorno
        ls.text_node({"", "{", "    "}),
        ls.insert_node(0), -- Cuerpo de la función
        ls.text_node({"", "}", ""}),
    }),
    ls.snippet("pubsf", {
        ls.text_node("public static function "),
        ls.insert_node(1), -- Nombre de la función
        ls.text_node("("),
        ls.insert_node(2), -- Parámetros
        ls.text_node("): "),
        ls.insert_node(3, "void"), -- Tipo de retorno
        ls.text_node({"", "{", "    "}),
        ls.insert_node(0), -- Cuerpo de la función
        ls.text_node({"", "}", ""}),
    }),
    ls.snippet("it", {
        ls.text_node("it('"),
        ls.insert_node(1), -- Descripción del test
        ls.text_node("', function () {"),
        ls.text_node({"", "    // Arrange", "    "}),
        ls.insert_node(0), -- Cuerpo de la prueba
        ls.text_node({"", "", "    // Act", "", "    // Assert", "", "});"}),
    }),
})
