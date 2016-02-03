# What is Juicer?

juicer is a simple API for extracting meta data from the text in web pages created by [Matt Haynes](https://github.com/matth). It works best on on "article" type pages such as those you find on blogs and news websites. It may not work at all on some types of page.

Two end points are provided `/api/article` and `/api/entities`, these can be use to extract meta data from a URL or by uploading a blob of text respectively.

juicer is a toy project, hacked together over the holidays. Please use and abuse it but with no guarantees!

Source code is available [here](https://github.com/matth/juicer).

## Props
juicer is other people's excellent work glued together in a web API, it's built with …

- [Goose](https://github.com/jiminoc/goose)
- [Stanford NER](http://nlp.stanford.edu/software/CRF-NER.shtml)

# Usage

This container exports HTTP server at 9000 port. Requests to root will return 404, checkout endpoints below.

_This is a copy of juicer's official landing page at [juicer.herokuapp.com](http://juicer.herokuapp.com)_

## Article meta data extraction

**URL**
`GET /api/article`

**Parameters**
`url` - A URL to the article page you want meta data for

**Response**
A JSON response, showing article meta data, body text and named entity text, frequency and type (one of Location, Person, Organization)

```
{
    "article" : {
        "url"          : http://www.bbc.co.uk/news/world-africa-16377824,
        "domain"       : "www.bbc.co.uk",
        "hash"         : "ac2f2e739421184f01c942b057f8449d",
        "title"        : "South Sudan 'sends more troops' to strife-torn town Pibor",
        "description"  : "Article meta description ...",
        "body"         : "Article body text ... ",
        "image"        : {
            "src"    : "http://news.bbcimg.co.uk/media/images/57644000/jpg/_57644369_armed-lou-nuer-youth-in-lik.jpg",
            "width"  : 304,
            "height" : 171
        },
        "entities"     : [
            {
                "text"      : "South Sudan",
                "type"      : "Location",
                "frequency" : 1
            },
            ...
        ]
    }
}
```

**Example**
Here's an example API call [/api/article?url=http://www.bbc.co.uk/news/world-africa-16377824](http://juicer.herokuapp.com/api/article?url=http://www.bbc.co.uk/news/world-africa-16377824)

## Named entity extraction
**URL**
`POST /api/entities`

**Parameters**
`text` - A string of text you want to analyse

**Response**
A JSON response, showing entity text, frequency and type (one of Location, Person, Organization)

```
{
    "entities" : [
        {
            "text"      : "Met Office",
            "type"      : "Organization",
            "frequency" : 2
        },
        {
            "text"      : "John Prior",
            "type"      : "Person",
            "frequency" : 1
        },
        {
            "text"      : "UK",
            "type"      : "Location",
            "frequency" : 2
        }
    ]
}
```

**Example**
You can try out this [here](http://juicer.herokuapp.com/#entities).

# Contributing

**juicer's Author's note:**
juicer is written in Scala, feel free to fork the project and play about. It's still in the "toy" project stage so contributions are very much welcome.

Author of juicer seems to be open up to suggestions, see [GitHub project](https://github.com/matth/juicer) for more.

I could not be able to build project on my development environment. But the prebuilt package on launchpad which is used in this container just works.
