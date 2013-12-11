#!/bin/sh

# needs:
#
# - CHATWORK_API_TOKEN: API Token for Chatwork
#
# - ROOM_ID:            Chatwork room id for jenkins notification
#
# - GITHUB_API_TOKEN:   API Token for Github
#
# - GITHUB_REPO:        Github repository
#     ex) tan-yuki/jenkins-phpunit-practice

# install composer
cd ${WORKSPACE}
php ./composer.phar install

# execute phpunit
cd ${WORKSPACE}/
php ./vendor/bin/phpunit \
  --log-junit=phpunit-result.xml \
  --log-tap=phpunit-result.tap \
  ./test

if [ $? -ne 0 ]; then
  # Get latest commit hash
  head_sha=`git rev-parse HEAD`

  # Get commiter name from Github API
  committer_name=` \
  curl -su ${GITHUB_API_TOKEN}:x-oauth-basic https://api.github.com/repos/${GITHUB_REPO}/commits/${head_sha} | \
  jq '.commit.author.name' | \
  sed -e 's/"//g'`

  # Get Chatwork mention tag
  mention_tag=`php ${WORKSPACE}/scripts/jenkins/_get_mention_tag.php ${committer_name}`

  body="${mention_tag} [info][title] developブランチでのテストに失敗しました[/title]commit: https://github.com/${GITHUB_REPO}/commit/${head_sha} [hr]`egrep '^ |^not' ${WORKSPACE}/phpunit-result.tap`[/info]"
  curl -sX POST -H "X-ChatWorkToken: ${CHATWORK_API_TOKEN}" -d "body=${body}" "https://api.chatwork.com/v1/rooms/${ROOM_ID}/messages"
fi
