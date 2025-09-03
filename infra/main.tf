# Bucket to store website code

resource "google_storage_bucket" "website" {
    name = "example-website-by-sajawal"
    location = "US"
}

# Make objects in bucket public
resource "google_storage_bucket_access_control" "public_rule" {
    bucket = google_storage_bucket.website.name
    entity = "allusers"
    role = "READER"
}

# Add src code to gcp bucket
resource "google_storage_bucket_object" "static_site_src" {
    name = "index.html"
    source = "../website/index.html"
    bucket = google_storage_bucket.website.name
}