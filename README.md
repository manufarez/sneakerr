# sneakerr
Rails 7 Hotwire shopping cart demo app with reviews engine

- Instant page updates
- Inline editing
- Streaming updates
- DomId used directly in the models (with include ActionView::RecordIdentifier)
- Redis avoided by using Postgres
- Delayed broadcast with broadcast_method_later_to
- Clearance gem used instead of Devise (which forces the controllers to inherit from _Authed_)
- Edit and destroy links on reviews are replaced with HTML
