CREATE UNIQUE INDEX emote
ON memorin_test.emotions (memory_id, emotion_type);

CREATE INDEX dated
ON memorin_test.memories (created_at);
