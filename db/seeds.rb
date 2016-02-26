# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.delete_all
Category.delete_all
Author.delete_all
User.delete_all
Country.delete_all
Authorization.delete_all
Coupon.delete_all

Book.create(title: "The Ruby Programming Language",
            description: %{
                The Ruby Programming Language is the authoritative guide to Ruby and provides
                comprehensive coverage of versions 1.8 and 1.9 of the language. It was written (and illustrated!) by an all-star team:
                David Flanagan, bestselling author of programming language "bibles" (including JavaScript:
                The Definitive Guide and Java in a Nutshell) and committer to the Ruby Subversion repository.
                Yukihiro "Matz" Matsumoto, creator, designer and lead developer of Ruby and author of Ruby in a Nutshell,
                which has been expanded and revised to become this book.
                why the lucky stiff, artist and Ruby programmer extraordinaire.
                This book begins with a quick-start tutorial to the language, and then explains the language in detail from
                the bottom up: from lexical and syntactic structure to datatypes to expressions and statements and on through
                methods, blocks, lambdas, closures, classes and modules.
                The book also includes a long and thorough introduction to the rich API of the Ruby platform,
                demonstrating -- with heavily-commented example code -- Ruby's facilities for text processing,
                numeric manipulation, collections, input/output, networking, and concurrency. An entire chapter is devoted to
                Ruby's metaprogramming capabilities.
                The Ruby Programming Language documents the Ruby language definitively but without the formality of a language
                specification. It is written for experienced programmers who are new to Ruby, and for current Ruby programmers who
                want to challenge their understanding and increase their mastery of the language.
              },
            books_in_stock: 5,
            price: 16,
            category_id: 1,
            author_id: 2
            )

Book.create(title: "Web Design for Developers",
            description: %{
                    Web Design for Developers will show you how to make your
              web-based application look professionally designed. We'll help you
              learn how to pick the right colors and fonts, avoid costly interface
              and accessibility mistakes -- your application will really come alive.
              We'll also walk you through some common Photoshop and CSS techniques
              and work through a web site redesign, taking a new design from concept
              all the way to implementation.
                              },
            books_in_stock: 4,
            price: 43,
            category_id: 2,
            author_id: 2
            )

Book.create(title: "Rails Test Prescriptions",
            description: %{
                    Rails Test Prescriptions is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                              },
            books_in_stock: 14,
            price: 35.53,
            category_id: 1,
            author_id: 2
            )

Book.create(title: "The Well-Grounded Rubyist",
            description: %{
                    The Well-Grounded Rubyist, Second Edition addresses both newcomers to
                    Ruby as well as Ruby programmers who want to deepen their understanding
                    of the language. This beautifullywritten and totally revised second
                    edition includes coverage of features that are new in Ruby 2.1, as well
                    as expanded and updated coverage of aspects of the language that
                    have changed.
                    Purchase of the print book includes a free eBook in PDF, Kindle, and ePub
                    formats from Manning Publications.
                    About the Technology
                    This is a good time for Ruby! It's powerful like Java or C++, and has
                    dynamic features that let your code react gracefully to changes at runtime.
                    And it's elegant, so creating applications, development tools, and administrative
                    scripts is easier and more straightforward. With the long-awaited Ruby 2,
                    an active development community, and countless libraries and productivity tools,
                    Ruby has come into its own.
                    About the Book
                    The Well-Grounded Rubyist, Second Edition is a beautifully written tutorial
                    that begins with your first Ruby program and goes on to explore sophisticated
                    topics like callable objects, reflection, and threading. The book concentrates on
                    the language, preparing you to use Ruby in any way you choose. This second edition
                    includes coverage of new Ruby features such as keyword arguments, lazy enumerators,
                    and Module#prepend, along with updated information on new and changed core classes and methods.

                    What's Inside

                    Clear explanations of Ruby concepts
                    Numerous simple examples
                    Updated for Ruby 2.1
                    Prepares you to use Ruby anywhere for any purpose
                    About the Author

                    David A. Black is an internationally known Ruby developer, author, trainer, speaker, event organizer,
                    and founder of Ruby Central, as well as a Lead Consultant at Cyrus Innovation.
                              },
            books_in_stock: 9,
            price: 32.99,
            category_id: 1,
            author_id: 2
            )

Book.create(title: "Ruby on Rails Tutorial: Learn Web Development with Rails (3rd Edition) (Addison-Wesley Professional Ruby)",
            description: %{
                    “Ruby on Rails™ Tutorial by Michael Hartl has become a must-read for developers learning how to build Rails apps.”
                    —Peter Cooper, Editor of Ruby Inside
                    Used by sites as diverse as Twitter, GitHub, Disney, and the Yellow Pages, Ruby on Rails is one of the
                    most popular frameworks for developing web applications, but it can be challenging to learn and use.
                    Whether you’re new to web development or new only to Rails, Ruby on Rails™ Tutorial, Third Edition, is the solution.

                    Best-selling author and leading Rails developer Michael Hartl teaches Rails by guiding you through the
                    development of three example applications of increasing sophistication, focusing on the fundamental techniques
                    in web development needed for virtually any kind of application. The updates to this edition include simplified
                    installation via a standard development environment in the cloud, use of the default Rails stack throughout,
                    a light-weight testing approach, an all-new section on image upload, and an all-new chapter on account activation
                    and password resets, including sending email with Rails.

                    This indispensable guide provides integrated tutorials not only for Rails, but also for the essential Ruby,
                    HTML, CSS, and SQL skills you’ll need when developing web applications. Hartl explains how each new technique
                    solves a real-world problem, and then he demonstrates it with bite-sized code that’s simple enough to understand,
                    yet novel enough to be useful. Whatever your previous web development experience, this book will guide you to
                    true Rails mastery.
                              },
            books_in_stock: 24,
            price: 29.84,
            category_id: 1,
            author_id: 2
            )

Book.create(title: "Practical Object-Oriented Design in Ruby: An Agile Primer (Addison-Wesley Professional Ruby) 1st ",
            description: %{
                    The Complete Guide to Writing More Maintainable, Manageable, Pleasing, and Powerful Ruby Applications
                    Ruby’s widely admired ease of use has a downside: Too many Ruby and Rails applications have been created
                    without concern for their long-term maintenance or evolution. The Web is awash in Ruby code that is
                    now virtually impossible to change or extend. This text helps you solve that problem by using powerful
                    real-world object-oriented design techniques, which it thoroughly explains using simple and practical Ruby examples.
                    Sandi Metz has distilled a lifetime of conversations and presentations about object-oriented design into a set of
                    Ruby-focused practices for crafting manageable, extensible, and pleasing code. She shows you how to build
                    new applications that can survive success and repair existing applications that have become impossible to change.
                    Each technique is illustrated with extended examples, all downloadable from the companion Web site, poodr.info.
                    The first title to focus squarely on object-oriented Ruby application design, Practical Object-Oriented Design in
                    Ruby will guide you to superior outcomes, whatever your previous Ruby experience. Novice Ruby programmers will find
                    specific rules to live by; intermediate Ruby programmers will find valuable principles they can flexibly interpret
                    and apply; and advanced Ruby programmers will find a common language they can use to lead development and
                    guide their colleagues.
                              },
            books_in_stock: 5,
            price: 28.41,
            category_id: 1,
            author_id: 1
            )

Book.create(title: "Beginning Ruby: From Novice to Professional (Expert's Voice in Open Source)",
            description: %{
                    Based on the bestselling first edition, Beginning Ruby: From Novice to Professional,
                    Second Edition is the leading guide for every type of reader who wants to learn Ruby from the ground up.
                    The new edition of this book provides the same excellent introduction to Ruby as the first edition plus updates
                    for the newest version of Ruby, including the addition of the Sinatra and Ramaze web application frameworks
                    and a chapter on GUI development so developers can take advantage of these new trends.
                    Beginning Ruby starts by explaining the principles behind object-oriented programming and within a few chapters
                    builds toward creating a full Ruby application. By the end of the book, in addition to in-depth knowledge of
                    Ruby, you'll also have basic understanding of many ancillary technologies such as SQL, XML, web frameworks, and networking.
                              },
            books_in_stock: 14,
            price: 24.34,
            category_id: 1,
            author_id: 2
            )

Book.create(title: "HTML and CSS: Design and Build Websites",
            description: %{
                    A full-color introduction to the basics of HTML and CSS from the publishers of Wrox!
                    Every day, more and more people want to learn some HTML and CSS. Joining the professional web designers
                    and programmers are new audiences who need to know a little bit of code at work (update a content
                      management system or e-commerce store) and those who want to make their personal blogs more attractive.
                    Many books teaching HTML and CSS are dry and only written for those who want to become programmers, which
                    is why this book takes an entirely new approach.

                    Introduces HTML and CSS in a way that makes them accessible to everyone—hobbyists, students, and
                    professionals—and it’s full-color throughout
                    Utilizes information graphics and lifestyle photography to explain the topics in a simple way that is engaging
                    Boasts a unique structure that allows you to progress through the chapters from beginning to end or just
                    dip into topics of particular interest at your leisure
                    This educational book is one that you will enjoy picking up, reading, then referring back to. It will make
                    you wish other technical topics were presented in such a simple, attractive and engaging way!
                              },
            books_in_stock: 14,
            price: 35.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design with HTML, CSS, JavaScript and jQuery Set",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 35.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
            description: %{
                    Do you want to build web pages, but have no previous experience? This friendly guide is
                    the perfect place to start. You’ll begin at square one, learning how the Web and web pages work,
                      and then steadily build from there. By the end of the book, you’ll have the skills to create a
                      simple site with multi-column pages that adapt for mobile devices.

Learn how to use the latest techniques, best practices, and current web standards—including HTML5 and CSS3.
Each chapter provides exercises to help you to learn various techniques, and short quizzes to make sure you understand key concepts.

This thoroughly revised edition is ideal for students and professionals of all backgrounds and skill levels,
whether you’re a beginner or brushing up on existing skills.

Build HTML pages with text, links, images, tables, and forms
Use style sheets (CSS) for colors, backgrounds, formatting text, page layout, and even simple animation effects
Learn about the new HTML5 elements, APIs, and CSS3 properties that are changing what you can do with web pages
Make your pages display well on mobile devices by creating a responsive web design
Learn how JavaScript works—and why the language is so important in web design
Create and optimize web graphics so they’ll download as quickly as possibles
                              },
            books_in_stock: 14,
            price: 35.53,
            category_id: 2,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Book.create(title: "Web Design",
            description: %{
                                        A two-book set for web designers and front-end developers
                    This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and
                    JavaScript & jQuery: Interactive Front-End Development.
                    Together these two books form an ideal platform for anyone who wants to master HTML and
                    CSS before stepping up to JavaScript and jQuery.

                    HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding
                    style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids,
                    and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent
                    combined introduction to these two technologies using a clear and simple visual approach
                    using diagrams, infographics, and photographs.

                    A handy two-book set that uniquely combines related technologies
                    Highly visual format and accessible language makes these books highly effective learning tools
                    Perfect for beginning web designers and front-end developers
                              },
            books_in_stock: 14,
            price: 30.53,
            category_id: 3,
            author_id: 1
            )

Category.create(title: "Ruby", id: 1)

Category.create(title: "HTML", id: 2)

Category.create(title: "CSS", id: 3)

Author.create(firstname: "Sam",
            lastname: "Ruby",
            id: 1
            )

Author.create(firstname: "David",
            lastname: "Hannerneson",
            id: 2
            )

User.create(firstname: "Sam",
            lastname: "Serious",
            email: "test@test.com",
            password: 12345678,
            admin: true
            )

User.create(firstname: "Sam22",
            lastname: "Serious22",
            email: "test1@test.com",
            password: 12345678
            )

Country.create(name: "Ukraine",
            id: 1
            )

Country.create(name: "GB",
            id: 2
            )

Delivery.create(name: "UPS Ground",
                price: 5,
                id: 1
            )

Delivery.create(name: "UPS Two Day",
                price: 10,
                id: 2
            )

Delivery.create(name: "UPS One Day",
                price: 15,
                id: 3
            )

Coupon.create(name: "blackfriday",
              discount: 30
            )
