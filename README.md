# Scrivn

![Build Status](https://codeship.com/projects/25b4cdd0-2f3a-0134-7f62-4a25dba64f1f/status?branch=master)
![Code Climate](https://codeclimate.com/github/raadler/Scrivn.png)
![Coverage Status](https://coveralls.io/repos/raadler/Scrivn/badge.png)

Scrivn is an app for fountain pen inks. Users can add inks to their
personal collections, and get the details and see a sample of a given ink in the database. More features are in the works, including extending the current ones to fountain pens.

I originally built this as my breakable toy for Launch Academy. I want to expand it and turn it into a resource for fountain pen enthusiasts, and would love help from other developers, especially if you're interested in fountain pens.


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
AWS_ACCESS_KEY=
AWS_SECRET_KEY=
S3_BUCKET=
```

The `AWS_ACCESS_KEY`, `AWS_SECRET_KEY`, and `S3_BUCKET` are used when uploading ink photos to Amazon S3.


##Known Bugs

(If you find a bug, please message me to report it.)

-When editing an ink, the picture url is reset to blank, even if a picture has previously been uploaded
