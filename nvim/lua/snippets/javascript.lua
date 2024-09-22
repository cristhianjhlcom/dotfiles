local ok, ls = pcall(require, "luasnip")

if (not ok) then return end

ls.add_snippets("javascript", {
    ls.snippet("clg", {
        ls.text_node("console.log("),
        ls.insert_node(1),
        ls.text_node(")"),
    })
})
