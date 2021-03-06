#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

module Deltacloud
  class Blob < BaseModel

    #already has an id from basemodel (for the key)
    attr_accessor :bucket
    attr_accessor :content_length
    attr_accessor :content_type
    attr_accessor :last_modified
    attr_accessor :content
    attr_accessor :user_metadata

    def to_hash(context)
      {
        :id => self.id,
        :href => context.bucket_url(bucket) + '/' + self.id,
        :bucket => { :rel => :bucket, :href => context.bucket_url(bucket), :id => bucket },
        :content_length => content_length,
        :content_type => content_type,
        :last_modified => last_modified,
        :content => content,
        :user_metadata => user_metadata
      }
    end

  end
end
