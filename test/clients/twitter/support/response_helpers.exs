defmodule ResponseHelpers do
  def response(429) do
    %HTTPoison.Response{
      body: %{"errors" => [%{"code" => 88, "message" => "Rate limit exceeded"}]},
      headers: [
        {"content-length", "56"},
        {"content-type", "application/json;charset=utf-8"},
        {"date", "Wed, 12 Jun 2019 10:47:55 GMT"},
        {"server", "tsa_o"},
        {"set-cookie",
         "personalization_id=\"v1_yIWmjsBdX8hU2aDS3g8rGA==\"; Max-Age=63072000; Expires=Fri, 11 Jun 2021 10:47:55 GMT; Path=/; Domain=.twitter.com"},
        {"set-cookie",
         "guest_id=v1%3A156033647584449553; Max-Age=63072000; Expires=Fri, 11 Jun 2021 10:47:55 GMT; Path=/; Domain=.twitter.com"},
        {"strict-transport-security", "max-age=631138519"},
        {"x-connection-hash", "a5af0ca3d66bb609353943d00056b115"},
        {"x-rate-limit-limit", "900"},
        {"x-rate-limit-remaining", "0"},
        {"x-rate-limit-reset", Integer.to_string(:os.system_time(:seconds) + 100)},
        {"x-response-time", "111"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization",
           "OAuth oauth_signature=\"bQ4whfo7GjvD1qkTFcHU0Fv%2FvOI%3D\", oauth_consumer_key=\"FqwckqzvH8P3n9UAL0PxAusSC\", oauth_nonce=\"M8owFG3zmYX48Wwc3skaZ290HcQ%2BFhjN\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1560336475\", oauth_version=\"1.0\", oauth_token=\"1136922891113717760-rF7yFcnZbeh9FGbpE5YxaTvzgCzviL\""}
        ],
        method: :get,
        options: [params: [{"screen_name", "nasa"}]],
        params: [{"screen_name", "nasa"}],
        url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa"
      },
      request_url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa",
      status_code: 429
    }
  end

  def response(401) do
    %HTTPoison.Response{
      body: %{
        "errors" => [%{"code" => 32, "message" => "Could not authenticate you."}]
      },
      headers: [
        {"content-length", "64"},
        {"content-type", "application/json; charset=utf-8"},
        {"date", "Wed, 12 Jun 2019 10:28:51 GMT"},
        {"server", "tsa_o"},
        {"set-cookie",
         "personalization_id=\"v1_AL/GkhN4VQJGVlIrR5v21Q==\"; Max-Age=63072000; Expires=Fri, 11 Jun 2021 10:28:51 GMT; Path=/; Domain=.twitter.com"},
        {"set-cookie",
         "guest_id=v1%3A156033533149897420; Max-Age=63072000; Expires=Fri, 11 Jun 2021 10:28:51 GMT; Path=/; Domain=.twitter.com"},
        {"strict-transport-security", "max-age=631138519"},
        {"x-connection-hash", "438036955e72838850d5d2747ca02e38"},
        {"x-response-time", "130"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization",
           "OAuth oauth_signature=\"45vIxuY0ca9mvR4fs4%2FL3B6E3vQ%3D\", oauth_consumer_key=\"FqwckqzvH8P3n9UAL0PxAusSC\", oauth_nonce=\"g7GwPRNTBcfFa3adiVE07yxcSZ%2F0TJTk\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1560335331\", oauth_version=\"1.0\", oauth_token=\"1136922891113717760-rF7yFcnZbeh9FGbpE5YxaTvzgCzviL\""}
        ],
        method: :get,
        options: [params: [{"screen_name", "nasa"}]],
        params: [{"screen_name", "nasa"}],
        url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa"
      },
      request_url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa",
      status_code: 401
    }
  end

  def response(200) do
    %HTTPoison.Response{
      body: [
        %{
          "contributors" => nil,
          "coordinates" => nil,
          "created_at" => "Wed Jun 12 02:19:21 +0000 2019",
          "entities" => %{
            "hashtags" => [],
            "symbols" => [],
            "urls" => [
              %{
                "display_url" => "twitter.com/i/web/status/1…",
                "expanded_url" => "https://twitter.com/i/web/status/1138631847783608321",
                "indices" => [116, 139],
                "url" => "https://t.co/aQHt3hIlIk"
              }
            ],
            "user_mentions" => []
          },
          "favorite_count" => 2738,
          "favorited" => false,
          "geo" => nil,
          "id" => 1_138_631_847_783_608_321,
          "id_str" => "1138631847783608321",
          "in_reply_to_screen_name" => nil,
          "in_reply_to_status_id" => nil,
          "in_reply_to_status_id_str" => nil,
          "in_reply_to_user_id" => nil,
          "in_reply_to_user_id_str" => nil,
          "is_quote_status" => false,
          "lang" => "en",
          "place" => nil,
          "possibly_sensitive" => false,
          "retweet_count" => 568,
          "retweeted" => false,
          "source" => "<a href=\"https://www.sprinklr.com\" rel=\"nofollow\">Sprinklr</a>",
          "text" =>
            "No journey is complete without the perfect soundtrack! 🎶 As we prepare to send the first woman and next man to the… https://t.co/aQHt3hIlIk",
          "truncated" => true,
          "user" => %{
            "protected" => false,
            "id_str" => "11348282",
            "friends_count" => 298,
            "has_extended_profile" => true,
            "followers_count" => 31_471_962,
            "following" => false,
            "default_profile" => false,
            "translator_type" => "regular",
            "profile_sidebar_fill_color" => "F3F2F2",
            "id" => 11_348_282,
            "profile_image_url" =>
              "http://pbs.twimg.com/profile_images/1091070803184177153/TI2qItoi_normal.jpg",
            "profile_link_color" => "205BA7",
            "is_translation_enabled" => false,
            "verified" => true,
            "utc_offset" => nil,
            "profile_sidebar_border_color" => "000000",
            "statuses_count" => 56070,
            "profile_text_color" => "000000",
            "is_translator" => false,
            "lang" => nil,
            "profile_background_image_url_https" =>
              "https://abs.twimg.com/images/themes/theme1/bg.png",
            "listed_count" => 93872,
            "location" => "",
            "contributors_enabled" => false,
            "profile_background_image_url" => "http://abs.twimg.com/images/themes/theme1/bg.png",
            "created_at" => "Wed Dec 19 20:20:32 +0000 2007",
            "name" => "NASA",
            "profile_background_color" => "000000",
            "notifications" => false,
            "entities" => %{
              "description" => %{"urls" => []},
              "url" => %{
                "urls" => [
                  %{
                    "display_url" => "nasa.gov",
                    "expanded_url" => "http://www.nasa.gov",
                    "indices" => [0, 23],
                    "url" => "https://t.co/TcEE6NS8nD"
                  }
                ]
              }
            },
            "url" => "https://t.co/TcEE6NS8nD",
            "profile_background_tile" => false,
            "default_profile_image" => false,
            "description" =>
              "Explore the universe and discover our home planet with @NASA. We usually post in EDT (UTC-4)",
            "favourites_count" => 5730,
            "geo_enabled" => false,
            "profile_image_url_https" =>
              "https://pbs.twimg.com/profile_images/1091070803184177153/TI2qItoi_normal.jpg",
            "profile_use_background_image" => true,
            "time_zone" => nil,
            "profile_banner_url" => "https://pbs.twimg.com/profile_banners/11348282/1558574092",
            "follow_request_sent" => false,
            "screen_name" => "NASA"
          }
        }
      ],
      headers: [
        {"cache-control", "no-cache, no-store, must-revalidate, pre-check=0, post-check=0"},
        {"content-disposition", "attachment; filename=json.json"},
        {"content-length", "73446"},
        {"content-type", "application/json;charset=utf-8"},
        {"date", "Wed, 12 Jun 2019 09:58:37 GMT"},
        {"expires", "Tue, 31 Mar 1981 05:00:00 GMT"},
        {"last-modified", "Wed, 12 Jun 2019 09:58:37 GMT"},
        {"pragma", "no-cache"},
        {"server", "tsa_o"},
        {"set-cookie",
         "personalization_id=\"v1_1KmrhO440imHFrhZ+oQL1A==\"; Max-Age=63072000; Expires=Fri, 11 Jun 2021 09:58:37 GMT; Path=/; Domain=.twitter.com"},
        {"set-cookie", "lang=en; Path=/"},
        {"set-cookie",
         "guest_id=v1%3A156033351762900798; Max-Age=63072000; Expires=Fri, 11 Jun 2021 09:58:37 GMT; Path=/; Domain=.twitter.com"},
        {"status", "200 OK"},
        {"strict-transport-security", "max-age=631138519"},
        {"x-access-level", "read-write"},
        {"x-connection-hash", "1b1df4f83185f4fcdb5b256aac41fa7d"},
        {"x-content-type-options", "nosniff"},
        {"x-frame-options", "SAMEORIGIN"},
        {"x-rate-limit-limit", "900"},
        {"x-rate-limit-remaining", "899"},
        {"x-rate-limit-reset", "1560334417"},
        {"x-response-time", "309"},
        {"x-transaction", "00ddc76900b1aa46"},
        {"x-twitter-response-tags", "BouncerCompliant"},
        {"x-xss-protection", "1; mode=block; report=https://twitter.com/i/xss_report"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization",
           "OAuth oauth_signature=\"4mIkiSOMmuEUNvtGNU7jVtZUAHs%3D\", oauth_consumer_key=\"FqwckqzvH8P3n9UAL0PxAusSC\", oauth_nonce=\"21Pw%2BOH4oQ6ct%2F%2B%2BEOfFn4wwy874j10f\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1560333517\", oauth_version=\"1.0\", oauth_token=\"1136922891113717760-rF7yFcnZbeh9FGbpE5YxaTvzgCzviL\""}
        ],
        method: :get,
        options: [params: [{"screen_name", "nasa"}]],
        params: [{"screen_name", "nasa"}],
        url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa"
      },
      request_url: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=nasa",
      status_code: 200
    }
  end
end
