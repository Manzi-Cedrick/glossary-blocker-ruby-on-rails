5.times do
    Glossary.create({
        source_code_lang: Faker::Book.title,
        target_lang_code: Faker::Book.title
    })
end
5.times do
    Term.create({
        source_term: Faker::ProgrammingLanguage.name,
        target_term: Faker::ProgrammingLanguage.name,
        glossary: Glossary.find(14)
    })
end