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
        glossary: Glossary.find(20)
    })
end
5.times do 
    Translation.create({
        source_language_code: Faker::Book.title,
        target_language_code: Faker::Book.title,
        source_text: Faker::Lorem.characters,
        glossary: Glossary.find(22)
    })
end