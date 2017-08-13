# Scrivn
This application can be seen at: http://scrivn.herokuapp.com/

Scrivn is an app for fountain pens and fountain pen inks, which I originally built as my capstone project for Launch Academy. It was my first complete rails app that I built from scratch, and I learned about managing complex relationships between different models using ActiveRecord, designing a front end in Foundation, and integrating gems such as Carrierwave And Devise.

In this app, users can add pens and inks to their
personal collections, and get the details and see a sample of a given ink in the database. More features are in the works, including reviews for pens and inks, and ink matching suggestions.

I want to eventually expand this app and turn it into a resource for fountain pen enthusiasts, and would love help from other developers, especially if you're interested in fountain pens.


## Setup

To run the app locally, run the following commands:

```no-highlight
$ git clone https://github.com/raadler/Scrivn.git
$ cd Scrivn
$ bundle
```

If this is the first time running the app, you will also need to create a development and test database:

```no-highlight
$ rake db:setup
```

Open the `.env` file to edit the environment variables:

```no-highlight
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_BUCKET=
```

The `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `S3_BUCKET` are used when uploading ink photos to Amazon S3.


##Known Bugs

(If you find a bug, please message me to report it.)

* When editing an ink, the picture url is reset to blank, even if a picture has previously been uploaded
* Mailers for registration and password recovery are not operational
* There's nothing stopping a user from adding more than one instance of the same ink to their collection
