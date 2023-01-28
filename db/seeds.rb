5.times do
    Glossary.create({
        source_code_lang: Faker::Book.title,
        target_lang_code: Faker::Book.title
    })
end