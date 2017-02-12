# Imgur Image Uploader

This script uploads a single image or images from a directory to imgur via imgur API and retrieves the uploaded url from imgur for a particular image in CSV format.

Execution
=========

* Uploading a single image.
```
$ ./groot.sh horse.jpg
```

* Uploading a directory of images
```
$ ./groot.sh Photos/*.jpg
```

The output file will be a CSV file with the `filename` and `URL` saved in `imgur.csv`
