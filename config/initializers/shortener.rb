# frozen_string_literal: true

Shortener.unique_key_length = 5
Shortener.charset = ('a'..'z').to_a + (0..9).to_a
